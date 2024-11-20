from datetime import date

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

from ..database import get_connection
from ..utils import hash_password

router = APIRouter(prefix="/auth", tags=["Authentication"])


class UserCreate(BaseModel):
    login: str
    firstname: str
    lastname: str
    birth_date: str
    password: str


class UserResponse(BaseModel):
    login: str


@router.post("/register", response_model=UserResponse)
def register_user(user: UserCreate):
    conn = get_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM users WHERE login = %s", (user.login,))
            if cursor.fetchone():
                return {
                    "login": user.login,
                    "message": "User with this login already exists.",
                }

            hashed_password = hash_password(user.password)

            cursor.execute(
                """
                INSERT INTO users (firstname, lastname, birth_date, login, password)
                VALUES (%s, %s, %s, %s, %s)
                RETURNING login
                """,
                (
                    user.firstname,
                    user.lastname,
                    user.birth_date,
                    user.login,
                    hashed_password,
                ),
            )

            new_user = cursor.fetchone()
            conn.commit()

        return {"login": new_user["login"]}
    except Exception as e:
        conn.rollback()
        print("Error:", e)
        raise HTTPException(status_code=500, detail="Internal Server Error")
    finally:
        conn.close()
