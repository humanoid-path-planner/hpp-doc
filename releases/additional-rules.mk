push:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".push; \
	done

print-version:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".print-version; \
	done

release:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		${MAKE} "$$child_dir".release; \
	done


# if repository is HPP_REPO, push current HEAD in master branch
%.push:
	cd ${SRC_DIR}/$(@:.push=); \
	if [ "${$(@:.push=)_repository}" = "${HPP_REPO}" ]; then \
		git push ${HPP_REPO}/$(@:.push=) HEAD:master; \
	fi

# if repository is HPP_REPO, print version of package 
%.print-version:
	@cd ${SRC_DIR}/$(@:.print-version=); \
	if [ "${$(@:.print-version=)_repository}" = "${HPP_REPO}" ]; then \
		echo "$(@:.print-version=): `pkg-config --modversion $(@:.print-version=)`"; \
	fi

# if variable is defined, call make release in package
%.release:
	if [ "${$(@:.release=)_version}" != "" ]; then \
		echo "Releasing version ${$(@:.release=)_version} of package $(@:.release=)"; \
		cd ${SRC_DIR}/$(@:.release=)/${BUILD_FOLDER}; \
		make release VERSION=${$(@:.release=)_version}; \
	fi

# for pinocchio, push in hpp branch.
pinocchio.push:
	@cd ${SRC_DIR}/$(@:.push=); \
	git push ${$(@:.push=)_repository}/$(@:.push=) HEAD:hpp

