-- CreateTable
CREATE TABLE "Question" (
    "question_id" SERIAL NOT NULL,
    "translation_id" INTEGER NOT NULL,
    "test_id" INTEGER NOT NULL,
    "is_direct" BOOLEAN NOT NULL,

    CONSTRAINT "Question_pkey" PRIMARY KEY ("question_id")
);

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_translation_id_fkey" FOREIGN KEY ("translation_id") REFERENCES "Translation"("translation_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "Test"("test_id") ON DELETE RESTRICT ON UPDATE CASCADE;
