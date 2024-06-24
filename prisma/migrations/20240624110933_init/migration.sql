-- CreateTable
CREATE TABLE "Translation" (
    "translation_id" SERIAL NOT NULL,
    "original_word_id" INTEGER NOT NULL,
    "original_language_id" INTEGER NOT NULL,
    "translated_word_id" INTEGER NOT NULL,
    "translated_language_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "Translation_pkey" PRIMARY KEY ("translation_id")
);

-- AddForeignKey
ALTER TABLE "Translation" ADD CONSTRAINT "Translation_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "WordsGroup"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;
