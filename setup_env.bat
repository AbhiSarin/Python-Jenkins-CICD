@echo off

echo Creating Virtual Environment...

python -m venv venv

call venv\Scripts\activate

echo Installing dependencies...

pip install --upgrade pip
pip install -r requirements.txt

echo Environment setup completed.