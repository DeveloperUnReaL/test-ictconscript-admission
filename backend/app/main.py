from contextlib import asynccontextmanager
import datetime
from fastapi import FastAPI, HTTPException
from fastapi.responses import PlainTextResponse

from app import db
from app.models import LogEntryIn, LogEntryOut

@asynccontextmanager
async def lifespan(app: FastAPI):
    db.init_db()
    yield

app = FastAPI(
    title="unit logbook API",
    description="backend REST API",
    version="0.0.1",
    lifespan=lifespan
)

@app.get("/health", response_class=PlainTextResponse, tags=["health"])
def health_check():
    return "OK"

@app.get("/entries", response_model=list[LogEntryOut], tags=["entries"])
def list_entries():
    return db.get_all_entries()

@app.get("/entries/{entry_id}", response_model=LogEntryOut, tags=["entries"])
def get_single_entry(entry_id: int):
    entry = db.get_entry(entry_id)
    if entry is None:
        raise HTTPException(status_code=404, detail=f"entry id {entry_id} not found")
    return entry


@app.post("/entries", response_model=LogEntryOut, status_code=201, tags=["entries"])
def create_entry(new_entry: LogEntryIn):
    iso_time = datetime.now(datetime.timezone.utc).isoformat()
    created = db.insert_entry(
        title=new_entry.title,
        body=new_entry.body,
        lat=new_entry.lat,
        lon=new_entry.lon,
        iso_time=iso_time,
    )
    return created