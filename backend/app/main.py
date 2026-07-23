from contextlib import asynccontextmanager
import datetime
import fastapi

## Init db

app = fastapi.FastAPI(
    title="unit logbook API",
    description="backend REST API",
    version="0.0.1",
)

def list_entries():
    return #db.get_all_entries()

def get_single_entry(entry_id: int):
    entry = db.get_entry(entry_id)
    if entry is None:
        raise #error
    return entry

def create_entry(new_entry: LogEntryIn):