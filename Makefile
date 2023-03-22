toc:
	cat GUIDE_RU.md | ./guide_scripts/toc.sh 1 4

pdf:
	pip3 install grip
	python3 -m grip GUIDE_RU.md --wide --user-content --title GUIDE_RU.pdf