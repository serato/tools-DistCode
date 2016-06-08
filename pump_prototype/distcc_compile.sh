#!/bin/sh
clear
clear

# set -x
rm /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/Objects-normal/i386/*

# readonly MANUAL_START=1

# source pump_config

# if [[ $MANUAL_START -eq 1 ]]; then
# 	export INCLUDE_SERVER_DIR='/Users/maximeviargues/tmp/socket_dir' 
# 	export INCLUDE_SERVER_PORT='/Users/maximeviargues/tmp/socket_dir/socket' 
# 	export PATH='/Users/maximeviargues/github/tools-DistCode/distcc:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
# 	# This is when running the server manually, not with pump
# 	export INCLUDE_SERVER_PID='29253'
# else
# 	pump_output=$(./pump --startup)
# 	echo "Pump output:"
# 	echo $pump_output
# 	eval "$pump_output"
# fi

# if [[ -z $INCLUDE_SERVER_PORT ]]; then
# 	echo "Server port is empty!"
# 	exit 1
# fi

# echo "Server port: $INCLUDE_SERVER_PORT"

pushd /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/map
export LANG=en_US.US-ASCII

# echo "Going to compile, press Enter to continue..."
# read sd

/Users/maximeviargues/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Distcc\ 3.2.xcplugin/Contents/usr/bin/clang -x c++ -arch i386 -fmessage-length=0 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -std=c++11 -stdlib=libc++ -Wno-trigraphs -fpascal-strings -O0 -Werror -Wno-missing-field-initializers -Wno-missing-prototypes -Wnon-virtual-dtor -Woverloaded-virtual -Wno-exit-time-destructors -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wno-empty-body -Wno-uninitialized -Wno-unknown-pragmas -pedantic -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wno-constant-conversion -Wno-int-conversion -Wno-bool-conversion -Wno-enum-conversion -Wno-shorten-64-to-32 -Wno-newline-eof -Wno-c++11-extensions -D__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES=0 -DBOOST_NO_CXX11_ATOMIC_SP -DBOOST_NO_CXX11_DELETED_FUNCTIONS -DBOOST_NO_CXX11_SCOPED_ENUMS -DBOOST_NO_CXX11_NULLPTR -DBOOST_NO_CXX11_RVALUE_REFERENCES -DBOOST_NO_CXX11_STD_UNORDERED -DBOOST_NO_CXX11_VARIADIC_TEMPLATES -DBOOST_NO_CXX11_VARIADIC_MACROS -DBOOST_NO_CXX11_REF_QUALIFIERS -D_DEBUG -DDEBUG=1 -isysroot /Applications/Xcode_7.0.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk -fasm-blocks -fstrict-aliasing -Wdeprecated-declarations -Winvalid-offsetof -mmacosx-version-min=10.7 -g -fvisibility=hidden -Wno-sign-conversion -I/Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/Debug/include -I../thirdparty/include -I../thirdparty/include/qt -I../thirdparty/tinyxml/tinyxml2-9708885e5e/src -I/Applications/Xcode_7.0.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk/usr/include/libxml2 -I../.. -I../modules -I. -Isrc -I/Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/DerivedSources/i386 -I/Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/DerivedSources -F/Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/Debug -std=c++11 -Wno-deprecated-register -Wno-deprecated-declarations -U__STRICT_ANSI__ -include /var/folders/1x/s_8t55r54mldzt8gvdqwjphh0000gp/C/com.apple.DeveloperTools/7.0-7A218/Xcode/SharedPrecompiledHeaders/prefix-ckxxcnwdzoimbwcpedsfepokawhg/prefix.h -MMD -MT dependencies -MF /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/Objects-normal/i386/DisplayList.d --serialize-diagnostics /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/Objects-normal/i386/DisplayList.dia -c /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/map/src/types/DisplayList.cpp -o /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/Objects-normal/i386/DisplayList.o


popd

# if [[ $MANUAL_START -ne 1 ]]; then
# 	echo "Shutting down the server..."
# 	./pump --shutdown
# fi

echo "results: "
ls -lsh /Users/maximeviargues/workspace/depot/Dev/Main/Working/20160216-Tools-Build-Speed/serato/bin/map.build/Debug/serato_map.build/Objects-normal/i386/Dis*
