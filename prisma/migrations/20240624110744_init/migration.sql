-- CreateTable
CREATE TABLE "TestResult" (
    "result_id" SERIAL NOT NULL,
    "test_id" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,

    CONSTRAINT "TestResult_pkey" PRIMARY KEY ("result_id")
);

-- AddForeignKey
ALTER TABLE "TestResult" ADD CONSTRAINT "TestResult_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "Test"("test_id") ON DELETE RESTRICT ON UPDATE CASCADE;
