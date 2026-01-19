venv:
	python3 -m venv --copies venv
	. venv/bin/activate
	python3 -m pip install black flake8 isort mypy
