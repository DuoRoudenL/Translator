-- AddForeignKey
ALTER TABLE "Translation" ADD CONSTRAINT "Translation_original_word_id_fkey" FOREIGN KEY ("original_word_id") REFERENCES "Word"("word_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Translation" ADD CONSTRAINT "Translation_translated_word_id_fkey" FOREIGN KEY ("translated_word_id") REFERENCES "Word"("word_id") ON DELETE RESTRICT ON UPDATE CASCADE;
