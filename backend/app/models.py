from typing import Optional
from pydantic import BaseModel, Field

class LogEntryIn(BaseModel):
    title: str = Field(..., max=120, description="Entry title")
    body: str = Field(..., description="Entry description")
    lat: Optional[float] = Field(None, description="Optional latitude")
    lon: Optional[float] = Field(None, description="Optional longitude")

class LogEntryOut(LogEntryIn):
    id: int
    isoTime: str