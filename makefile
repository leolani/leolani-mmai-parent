SHELL = /bin/bash

project_name ?= "cltl-eliza"

project_components = $(addprefix ${project_root}/, \
		cltl-combot \
		cltl-requirements \
		cltl-eliza-app \
		cltl-eliza \
		cltl-chat-ui \
		cltl-vad \
                cltl-asr)

git_local ?= ..
git_remote ?= https://github.com/leolani


include util/make/makefile.parent.mk
include util/make/makefile.git.mk
