if not exist tests\data mkdir tests\data || exit 1
xcopy test_data\coutwildrnp.zip tests\data || exit 1
xcopy test_data\coutwildrnp.tar tests\data || exit 1
xcopy test_data\coutwildrnp.json tests\data || exit 1

:: The tests are finiching but it hangs at the end :-/
:: pytest -s -rxs -v -k "not (test_fio_ls_single_layer or test_directory or test_directory_trailing_slash or test_options or test_transaction)" tests
