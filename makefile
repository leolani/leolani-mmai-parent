SHELL = /bin/bash

project_name ?= "cltl-eliza"

project_components = $(addprefix ${project_root}/, \
		emissor \
		cltl-requirements \
		cltl-combot \
		cltl-backend \
		cltl-leolani-app \
		cltl-leolani \
		cltl-emissor-data \
		cltl-knowledgerepresentation \
		cltl-knowledgeextraction \
		cltl-knowledgelinking \
		cltl-languagegeneration \
		cltl-mention-detection \
		cltl-emotionrecognition \
		cltl-dialogueclassification \
		cltl-g2ky \
		cltl-questionprocessor \
		cltl-visualresponder \
		cltl-about-agent \
		cltl-eliza \
		cltl-chat-ui \
		cltl-face-recognition \
		cltl-object-recognition \
		cltl-vad \
		cltl-asr)

git_local ?= ..
git_remote ?= https://github.com/leolani


include util/make/makefile.parent.mk
include util/make/makefile.git.mk


submodules := $(shell git submodule | xargs -L1 | cut -f 2 -d ' ' | grep -v util | xargs)

.PHONY: update-build
update-build:
	-git submodule foreach 'git submodule update --remote util'

	for sm in $(submodules); do \
		cd $$sm; \
		(git diff --cached --quiet \
		  && git add util \
			&& git commit -m "Updated cltl-build") \
			  || (echo "Stash is not empty"; exit 1); \
		cd -; \
	done

	(git diff --cached --quiet \
	  && git add $(submodules) \
		&& git commit -m "Updated cltl-build") \
		  || (echo "Stash is not empty"; exit 1)
