test:
	nosetests

install:
	pip install nvprof

install_dev:
	pip install -e .

uninstall:
	pip uninstall nvprof

clean:
	rm -r build/ dist/ nvprof.egg-info/

# twine - a tool for uploading packages to PyPI
install_twine:
	pip install twine

build:
	python setup.py sdist
	python setup.py bdist_wheel --universal

# PyPI production
pypi_register:
	twine register dist/nvprof-*.whl

publish:
	twine upload dist/*

# PyPI test
test_pypi_register:
	python setup.py register -r pypitest

test_publish:
	#python setup.py sdist upload -r pypitest
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

test_install:
	pip install --verbose --index-url https://test.pypi.org/simple/ nvprof
