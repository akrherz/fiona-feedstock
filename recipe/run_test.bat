if not exist tests\data mkdir tests\data || exit 1
xcopy test_data\coutwildrnp.zip tests\data /s /e /y || exit 1
xcopy test_data\coutwildrnp.tar tests\data /s /e /y || exit 1
xcopy test_data\coutwildrnp.json tests\data /s /e /y || exit 1

:: The tests are finishing but it hangs at the end :-/
REM pytest -s -rxs -v -k "not (test_fio_ls_single_layer or test_directory or test_directory_trailing_slash or test_options or test_transaction or test_no_append_driver_cannot_append[PCIDSK])" tests