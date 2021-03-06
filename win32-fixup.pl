#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'NEWS'

require "../local-paths.lib";

$package_string = "\"serd 0.30\"";
$version_string = "\"0.30.11\"";
$serd_version = "0.30.11";
$major = 0;
$minor = 30;
$micro = 11;
$binary_age = 3011;
$interface_age = 0;
$current_minus_age = 0;
$gettext_package = "serd";
$exec_prefix = "lib";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@VERSION@/$version_string/g;
	    s/\@PACKAGE_VERSION@/$version_string/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@SERD_VERSION@/$serd_version/g;
	    s/\@SERD_API_VERSION@/$serd_api_version/g;
	    s/\@SERD_MAJOR_VERSION\@/$major/g;
	    s/\@SERD_MINOR_VERSION\@/$minor/g;
	    s/\@SERD_MICRO_VERSION\@/$micro/g;
	    s/\@SERD_INTERFACE_AGE\@/$interface_age/g;
	    s/\@SERD_BINARY_AGE\@/$binary_age/g;
	    s/\@LIB_SERD@/$gettext_package/g;
	    s/\@DLL_NAME\@/$gettext_package/g;
	    s/\@GETTEXT_PACKAGE\@/$gettext_package/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@PangoBuildProjectFolder@/$pango_build_project_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@GenericWin64LibraryFolder@/$generic_win64_library_folder/g;
	    s/\@GenericWin64BinaryFolder@/$generic_win64_binary_folder/g;
	    s/\@Debug64TestSuiteFolder@/$debug64_testsuite_folder/g;
	    s/\@Release64TestSuiteFolder@/$release64_testsuite_folder/g;
	    s/\@Debug64TargetFolder@/$debug64_target_folder/g;
	    s/\@Release64TargetFolder@/$release64_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@LibraryExt@/$library_ext/g;
	    s/\@PREFIX@/$prefix/g;
	    s/\@EXEC_PREFIX@/$exec_prefix/g;
	    s/\@INCLUDEDIR@/$generic_include_folder/g;
	    s/\@LIBDIR@/$generic_library_folder/g;
	    print OUTPUT;
	}
}

my $command=join(' ',@ARGV);

if (-1 != index($command, "-linux")) {
	$library_ext = ".a";
} else {
	$library_ext = ".lib";
}

if (-1 != index($command, "-X64")) {
	$serd_api_version = "64-0";
} else {
	$serd_api_version = "32-0";
}

process_file ("serd.pc");

if (-1 != index($command, "-buildall")) {
	process_file ("build/serd_config.h");
	process_file ("build/msvc/serd.rc");
	process_file ("build/msvc/serd.vsprops");
	process_file ("build/msvc/serd.props");
}