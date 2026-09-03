copy test_data\coutwildrnp.tar tests\data\ || exit 1
copy test_data\coutwildrnp.json tests\data\ || exit 1

python run_test.py
if errorlevel 1 exit 1

python -m pytest -v -rfEsx ^
    -m "not wheel and not network" ^
    --deselect tests/test_pyopener.py::test_opener_fsspec_zip_http_fs ^
    tests
if errorlevel 1 exit 1
