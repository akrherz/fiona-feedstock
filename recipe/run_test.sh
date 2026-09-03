set -ex

# tests/conftest.py creates these on demand; prefer the copies shipped with the
# recipe so the test run does not have to write into tests/data.
cp test_data/coutwildrnp.tar tests/data/
cp test_data/coutwildrnp.json tests/data/

python run_test.py

# "wheel" tests only apply to the PyPI wheels. The "network" tests (plus
# test_opener_fsspec_zip_http_fs, which upstream marked as such only after
# 1.10.1) fetch data from github.com and S3, so they are skipped here.
python -m pytest -v -rfEsx \
    -m "not wheel and not network" \
    --deselect tests/test_pyopener.py::test_opener_fsspec_zip_http_fs \
    tests
