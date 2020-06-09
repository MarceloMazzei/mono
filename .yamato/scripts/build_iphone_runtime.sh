git submodule update --init --recursive

echo $UNITY_THISISABUILDMACHINE

bash external/buildscripts/build_runtime_iphone.sh --runtime-only
if [ $? -eq 0 ]
then
  echo "mono build script ran successfully"
else
  echo "mono build script failed" >&2
  exit 1
fi

mkdir -p incomingbuilds/iphoneruntime
cp -r builds/* incomingbuilds/iphoneruntime/