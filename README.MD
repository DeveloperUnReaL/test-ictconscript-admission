# SWDEV Front & Back

## Live Deployments
 **Backend API:** https://test-ictconscript-admission-n4zy.onrender.com/
	
 **Frontend (GitHub Pages):** https://developerunreal.github.io/test-ictconscript-admission/
## Backend 
Built with FastAPI + SQLite. Source in [`backend/`](./backend). 
### Run locally
```bash 
cd backend 
docker build -t unit-logbook . 
docker run -p 8000:8000 unit-logbook 
```
 Then visit `http://localhost:8000/health`. 
### API routes 
Full interactive API docs (Swagger UI, auto-generated): https://test-ictconscript-admission-n4zy.onrender.com/docs

## Frontend
Built with Flutter web. Source in [`challenges/unit_logbook/`](./challenges/unit_logbook).
### Run locally
```bash 
cd challenges/unit_logbook 
flutter pub get 
flutter run -d chrome 
```
## Repo structure

    test-ictconscript-admission
    -README.MD
    -backend\
	    -app\  #backend source
	    -sample-data\
		    -data.json
	    -venv\  #python venv
	    -Dockerfile
	    -requirements.txt
    -docs\   #Flutter web build output
    -.git\
    -gitignore
   


