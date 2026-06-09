@echo off

echo Deploying Application...

xcopy /E /I /Y app deployed_app

echo Deployment Complete.