#!/usr/bin/env sh
#===============================================================================
#
#          FILE: setup.sh
#
#         USAGE: ./setup.sh
#
#   DESCRIPTION: Development Environment Setup Script
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yassine ElBadaoui
#  ORGANIZATION: Yassine ElBadaoui
#       CREATED: 2024/01/11 11:11
#      REVISION:  ---
#===============================================================================

# shellcheck disable=SC3000-SC4000
# shellcheck enable=require-variable-braces

set -o nounset # Treat unset variables as an error

# Global Variables ##########################################

USER_INFO_SHELL=".userinfo.sh"
export PATH="${PATH}:/usr/local/bin"
# VERBOSE='--verbose'
VERBOSE=''
VENDOR_PATH='vendor/bundle'
# ENVIRONMENT="${1-dev}"
# BIN_FOLDER='/usr/local/bin'
# GEM_INSTALL="sudo gem install -n ${BIN_FOLDER}"

# General Functions ##########################################

# Check if a command is found in environment path.
_command_found() {
	command -v "${1}" >/dev/null 2>&1
}

# Setup Development Environment ##########################################

# Save Git author info.
_save_git_author_info() {
	# shellcheck disable=SC1091
	# shellcheck source=.
	if [ -f "${USER_INFO_SHELL}" ]; then
		source "${USER_INFO_SHELL}"
	fi
	echo "Set user Git author name to \"${GIT_AUTHOR_NAME}\"."
	git config user.name "${GIT_AUTHOR_NAME}"
	echo "Set user Git author email address to \"${GIT_AUTHOR_EMAIL}\"."
	git config user.email "${GIT_AUTHOR_EMAIL}"
}

# Setup Git.
_setup_git() {
	# Do not ignore filenames case.
	git config core.ignorecase false
}

_read_user_info() {
	# shellcheck disable=SC1091
	# shellcheck source=.
	if [ -f "${USER_INFO_SHELL}" ]; then
		echo "Load ${USER_INFO_SHELL}"
		source "${USER_INFO_SHELL}"
		_fullname="${GIT_AUTHOR_NAME}"
		_email="${GIT_AUTHOR_EMAIL}"
	fi
	if [ -z "${_fullname+x}" ]; then
		printf "Enter your full name: "
		read -r _fullname
		_fullname="$(printf '%s' "${_fullname}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
	fi
	if [ -z ${_email+x} ]; then
		printf "Enter your work e-mail address: "
		read -r _email
		_email="$(printf '%s' "${_email}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
	fi
	if [ ! -f "${USER_INFO_SHELL}" ]; then
		cat <<-EOT >"${USER_INFO_SHELL}"
			#!/usr/bin/env sh

			GIT_AUTHOR_NAME='${_fullname}'
			GIT_AUTHOR_EMAIL='${_email}'
			GIT_COMMITTER_NAME='${_fullname}'
			GIT_COMMITTER_EMAIL='${_email}'
		EOT
		echo "Saved user info into \"${USER_INFO_SHELL}\""
	fi
	echo "This script will be using the following information in this session:"
	echo "Full Name: \"${_fullname}\""
	echo "Email: \"${_email}\""
	echo
}

# shellcheck disable=SC2120
# Generate SSH keys if needed.
_generate_ssh_keys() {
	local RSA_KEY_PATH="${HOME}/.ssh/${1-id}_rsa"
	local ED25519_KEY_PATH="${HOME}/.ssh/${1-id}_ed25519"
	if [ -f "${RSA_KEY_PATH}" ]; then
		echo "${RSA_KEY_PATH} already exists."
	else
		echo "Generating RSA Key ..."
		ssh-keygen -t rsa -b 4096 -f "${RSA_KEY_PATH}" -C "${GIT_AUTHOR_EMAIL}" -N ''
	fi
	if [ -f "${ED25519_KEY_PATH}" ]; then
		echo "${ED25519_KEY_PATH} already exists."
	else
		echo "Generating Ed25519 Key ..."
		ssh-keygen -t ed25519 -f "${ED25519_KEY_PATH}" -C "${GIT_AUTHOR_EMAIL}" -N ''
	fi
}

# Install Homebrew and Homebrew formulas.
_install_homebrew_formula() {
	hash brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	# shellcheck disable=SC2086
	brew bundle --no-upgrade --no-lock ${VERBOSE}
}

# Install Xcode Command Line Tools (CLT).
_install_xcode_commandline_tools() {
	XCODE_VERSION=$(xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/')
	ACCEPTED_LICENSE_VERSION=$(defaults read /Library/Preferences/com.apple.dt.Xcode 2>/dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2)

	if [ "${XCODE_VERSION}" = "${ACCEPTED_LICENSE_VERSION}" ]; then
		echo "Xcode Command Line Tools is already installed successfully."
		exit 0 #success
	else
		echo "Installing Xcode Command Line Tools ..."
		xcode-select --install
		echo "Agreeing to license agreement on behalf of you ..."
		sudo xcodebuild -license accept
	fi
}

# Install Git LFS hooks.
_install_git_lfs() {
	make install-git-lfs
}

# Install dependencies.
_install_dependencies() {
	make install-dependencies
}

# Install Bundler.
_install_gems() {
	echo
	if ! _command_found bundle; then
		echo "Installing Bundler ..."
		echo "Please input the login password for the following user: \"${USER}\" (The user should have administrative privilege):"
		# ${GEM_INSTALL} bundler
		gem install bundler
	fi
	echo "Updating Bundler ..."
	bundle update --bundler
	echo "Installing needed gems ..."
	bundle config set --local path "${VENDOR_PATH}"
	# shellcheck disable=SC2086
	bundle install ${VERBOSE}
}

# Install additional homebrew formulas
_install_additional_homebrew_formulas() {
	brew bundle --file=/dev/stdin <<-EOT
		cask 'fork'
		cask 'jq'
		cask 'visual-studio-code'
	EOT
}

# Main ##########################################

_main() {
	_read_user_info
	_save_git_author_info
	_setup_git
	_generate_ssh_keys
	_install_xcode_commandline_tools
	_install_homebrew_formula
	# _install_additional_homebrew_formulas
	_install_git_lfs
	_install_gems
	_install_dependencies
}

_main
