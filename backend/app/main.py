from contextlib import asynccontextmanager
import datetime
import fastapi

from app import db
from app.models import LogEntryIn, LogEntryOut

@asynccontextmanager
async def lifespan(app: fastapi.FastAPI):
    db.init_db()
    yield

app = fastapi.FastAPI(
    title="unit logbook API",
    description="backend REST API",
    version="0.0.1",
    lifespan=lifespan
)

def list_entries():
    return db.get_all_entries()

def get_single_entry(entry_id: int):
    entry = db.get_entry(entry_id)
    if entry is None:
        raise fastapi.HTTPException(status_code=404, detail=f"entry id {entry_id} not found")
    return entry

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