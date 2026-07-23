import sqlite3
import json
import os
from pathlib import Path
 
DB_PATH = os.environ.get("DB_PATH", "logbook.db")
SAMPLE_DATA_PATH = Path(__file__).parent.parent / "sample-data" / "data.json"
 
def get_connection():
    conn = sqlite3.connect(DB_PATH, check_same_thread=False)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    conn = get_connection()
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            body TEXT NOT NULL,
            lat REAL,
            lon REAL,
            isoTime TEXT NOT NULL
        )
        """
    )
    conn.commit()

def get_all_entries():
    conn = get_connection()
    rows = conn.execute("SELECT * FROM entries ORDER BY isoTime DESC").fetchall()
    conn.close()
    return [dict(row) for row in rows]

def get_entry(entry_id: int):
    conn = get_connection()
    row = conn.execute("SELECT * FROM entries WHERE id = ?", (entry_id,)).fetchone()
    conn.close()
    return dict(row) if row else None

def insert_entry(title: str, body: str, lat, lon, iso_time: str):
    conn = get_connection()
    cursor = conn.execute(
        "INSERT INTO entries (title, body, lat, lon, isoTime) VALUES (?, ?, ?, ?, ?)",
        (title, body, lat, lon, iso_time),
    )
    conn.commit()
    new_id = cursor.lastrowid
    conn.close()
    return get_entry(new_id)
