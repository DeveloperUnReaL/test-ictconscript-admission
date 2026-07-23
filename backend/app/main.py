from contextlib import asynccontextmanager
import datetime
import fastapi

from app import db

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
    return #db.get_all_entries()

def get_single_entry(entry_id: int):
    entry = db.get_entry(entry_id)
    if entry is None:
        raise #error
    return entry

def create_entry(new_entry: LogEntryIn):