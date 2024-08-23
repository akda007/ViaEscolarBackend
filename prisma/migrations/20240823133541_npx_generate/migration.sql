-- CreateTable
CREATE TABLE "personInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "birthdate" DATETIME NOT NULL,
    "RG" TEXT NOT NULL,
    "CPF" TEXT NOT NULL,
    "Phone" TEXT NOT NULL,
    "Address" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Parent" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "infoId" INTEGER NOT NULL,
    CONSTRAINT "Parent_infoId_fkey" FOREIGN KEY ("infoId") REFERENCES "personInfo" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Mensalidades" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "parentId" INTEGER NOT NULL,
    CONSTRAINT "Mensalidades_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Parent" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "School" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "personInfoId" INTEGER NOT NULL,
    "admissionDate" DATETIME NOT NULL,
    "position" TEXT NOT NULL,
    "Salary" REAL NOT NULL,
    CONSTRAINT "Employee_personInfoId_fkey" FOREIGN KEY ("personInfoId") REFERENCES "personInfo" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Vehicle" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "model" TEXT NOT NULL,
    "Brand" TEXT NOT NULL,
    "Color" TEXT NOT NULL,
    "Plate" TEXT NOT NULL,
    "Year" INTEGER NOT NULL,
    "Seats" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Children" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "infoId" INTEGER NOT NULL,
    CONSTRAINT "Children_infoId_fkey" FOREIGN KEY ("infoId") REFERENCES "personInfo" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Route" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "schoolId" INTEGER NOT NULL,
    "vehicleId" INTEGER NOT NULL,
    CONSTRAINT "Route_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES "Vehicle" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Route_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
