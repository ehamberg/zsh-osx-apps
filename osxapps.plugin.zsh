# Find all apps in /Applicatons and $HOME/Applications and create a shell
# function with that name (in lowercase), followed by "app" (e.g.
# “pixelmatorapp”) that launches the app with the given arguments
for a in {$HOME,}/Applications/*.app(N) ; do
	eval "\${\${a:t:l:r}//[ -]/}app() {\
		if (( \$# == 0 )); then\
			open ${(qq)a};\
		else\
			open -a ${(qq)a} \$@;\
		fi\
	}"
done
