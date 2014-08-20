# Find all apps in /Applicatons and $HOME/Applications and create a shell
# function with that name (in lowercase) that launches the app with the given
# arguments
for a in {$HOME,}/Applications/*.app ; do
	eval "\${\${a:t:l:r}//[ -]/}() {\
		if (( \$# == 0 )); then\
			open ${(qq)a};\
		else\
			open -a ${(qq)a} \$@;\
		fi\
	}"
done

