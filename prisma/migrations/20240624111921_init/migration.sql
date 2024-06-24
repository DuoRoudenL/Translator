-- AddForeignKey
ALTER TABLE "Translation" ADD CONSTRAINT "Translation_original_language_id_fkey" FOREIGN KEY ("original_language_id") REFERENCES "Language"("language_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Translation" ADD CONSTRAINT "Translation_translated_language_id_fkey" FOREIGN KEY ("translated_language_id") REFERENCES "Language"("language_id") ON DELETE RESTRICT ON UPDATE CASCADE;
