import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'tr': {
      // General/Global
      'success': 'Başarılı',
      'error': 'Hata',
      'warning': 'Uyarı',
      'save': 'Kaydet',
      'delete': 'Sil',
      'edit': 'Düzenle',
      'search': 'Ara...',
      'all': 'Tümü',
      'cancel': 'İptal',
      'yes': 'Evet',
      'no': 'Hayır',
      'successful': 'Başarılı',
      'connecting': 'Bağlantı kuruluyor...',
      'scanning_databases': 'Veritabanları taranıyor...',
      'analyzing_content': 'İçerik analiz ediliyor...',
      'gathering_data': 'Bilgiler derleniyor...',
      'finalizing_setup': 'Son yapılandırmalar tamamlanıyor...',
      'tag_helper_text': 'Etiket eklemek için enter tuşuna basın',
      'tag_hint': 'Etiketle...',
      'retry': 'Yeniden Dene',
      'image_capture_failed': 'Görüntü alınamadı',
      'image_conversion_failed': 'Görüntü dönüştürülemedi',
      'share_failed_detail': 'Paylaşım başarısız: @error',
      'language_not_found': 'Dil bilgisi bulunamadı',
      'tts_error_detail': 'Seslendirme hatası: @message',
      'tts_start_failed': 'Seslendirme başlatılamadı',
      'unsupported_language': 'Desteklenmeyen dil: @language',

      // Home & Navigation
      'library': 'Kitaplık',
      'my_books': 'Kitaplarım',
      'my_words': 'Kelimelerim',
      'recently_opened': 'Son Açılanlar',
      'update_available_title': 'Yeni Güncelleme Mevcut!',
      'update_available_body':
          'Uygulamanın yeni bir sürümü yayınlandı.\nDaha iyi bir deneyim için lütfen uygulamayı güncelleyin.\n\nMevcut Sürüm: @current\nYeni Sürüm: @new',
      'later': 'Daha Sonra',
      'update': 'Güncelle',

      // Profile Page
      'profile': 'Profil',
      'reading_time_badges': 'Okuma Süresi Rozetleri',
      'streak_badges': 'Seri Rozetleri',
      'reading_average': 'Okuma Ortalaması',
      'longest_streak': 'En Uzun Seri',
      'min_per_day': 'dk/gün',
      'days': 'gün',
      'badge_earned_starter': 'Başlangıç',
      'badge_earned_determined': 'Azimli',
      'badge_earned_bookworm': 'Kitap Kurdu',
      'badge_earned_legend': 'Efsane',
      'badge_streak_warmup': 'Isınma',
      'badge_streak_disciplined': 'Disiplinli',
      'badge_streak_addicted': 'Bağımlı',
      'badge_streak_legend': 'Efsane',
      'language_settings': 'Dil Ayarları',
      'select_language': 'Dil Seçin',

      // Library / Book Detail Page
      'no_results': 'Sonuç bulunamadı',
      'no_books': 'Kitap bulunamadı',
      'categories': 'Kategoriler',
      'languages': 'Diller',
      'book': 'Kitap',
      'book_not_found': 'Seçili kitap bulunamadı',
      'book_not_found_message': 'Kitap bulunamadı',
      'downloaded_count': '@count İndirilen',
      'read': 'Oku',
      'download': 'İndir',
      'summary': 'Özet',
      'add_book': 'Kitap Ekle',
      'general_error_message': 'Sorun Oluştu Lütfen Daha Sonra Deneyin!',
      'download_error_message':
          'İndirme sırasında hata oluştu lütfen daha sonra deneyin',

      // Categories (Static lists)
      'category_children': 'Çocuk',
      'category_adventure': 'Macera',
      'category_sci_fi': 'Bilim Kurgu',
      'category_education': 'Eğitim',
      'category_biographies': 'Biyografiler',
      'category_philosophy': 'Felsefe',

      // Progress Status
      'status_not_started': 'Başlamadı',
      'status_continuing': 'Devam Ediyor',
      'status_done': 'Bitti',

      // Edit Book Metadata Page
      'edit_book': 'Kitap Düzenle',
      'edit_tag': 'Etiket Düzenle',
      'click_to_select_cover': 'Kapak Seçmek için Tıkla',
      'book_title': 'Kitap Adı',
      'enter_book_title': 'Kitap adını girin',
      'book_title_required': 'Kitap adı boş olamaz',
      'authors': 'Yazarlar',
      'add_new_author': 'Yeni yazar ekle',
      'add_author': 'Yazar Ekle',
      'language': 'Dil',

      // Vocabulary History Page
      'vocabulary_history': 'Kelime Geçmişi',
      'no_saved_words': 'Henüz kaydedilmiş kelime bulunmuyor.',
      'show_recommended_app': 'Önerilen Uygulamayı Göster',
      'recommended_app_title': 'İngilizce Sorular',
      'recommended_app_desc': 'Kelime testleri için indirin!',
      'hide': 'Gizle',
      'no_words_in_language': 'Bu dilde kaydedilmiş kelime bulunmuyor.',
      'read_slowly': 'Yavaş Oku',
      'read_normally': 'Normal Oku',
      'learned': 'Öğrendim',
      'word_saved_to_history': 'Kelimelerime kaydedildi.',
      'word_removed_from_history': 'Kelimelerimden kaldırıldı.',
      'tts_error': 'Seslendirme hatası',
      'asset_load_error': 'Asset kitap yüklenirken hata oluştu',

      // Notes (Postscript) Pages
      'my_notes': 'Notlarım',
      'note': 'Not/Vurgula',
      'note_prefix': 'Not: @note',
      'note_write_here': 'Notunuzu yazın...',
      'color': 'Renk',
      'tags': 'Etiketler',
      'underline': 'Alt Çizgi',
      'edit_note': 'Notu Düzenle',
      'add_note': 'Not Ekle',
      'notes_and_highlights': 'Notlar ve Vurgular',
      'no_notes_saved_for_book':
          'Bu kitap için kaydedilmiş bir not bulunmamaktadır.',
      'note': 'Not',

      // Sharing
      'share_quote': 'Alıntıyı Paylaş',
      'share': 'Paylaş',
      'format_uppercase': 'BİÇİM',
      'text_uppercase': 'METİN',
      'font_size_uppercase': 'YAZI BOYUTU',
      'background_uppercase': 'ARKA PLAN',
      'bold': 'Kalın',
      'underline_option': 'Alt Çizgi',
      'select_text_color': 'Metin Rengini Seçin',
      'select_card_color': 'Kart Rengini Seçin',
      'earned_new_badges': 'Yeni Rozetler Kazandım!',
      'shared_with_polyread': 'Polyread ile Paylaşıldı',
      'share_badge': 'Rozetini Paylaş',

      // Drawer
      'chapters': 'Bölümler',
      'chapters_count': '@count bölüm',
      'search_chapters': 'Bölümlerde ara...',
      'chapter_not_found': 'Bölüm bulunamadı',
      'could_not_navigate_chapter': 'Bölüme gidilemedi',

      // Notification Service
      'quote_of_the_day': 'Günün Sözü',
      'reading_is_beautiful': 'Okumak güzeldir.',

      // Languages
      'lang_tr': 'Türkçe',
      'lang_en': 'İngilizce',
      'lang_es': 'İspanyolca',
      'lang_fr': 'Fransızca',
      'lang_de': 'Almanca',
      'lang_it': 'İtalyanca',
      'settings': 'Ayarlar',
      'font_size': 'Yazı Boyutu',
      'go_to_last_saved_page': 'Son Kayıtlı Sayfaya Git',
      'no_books_opened': 'Henüz bir kitap açılmadı',
      'no_name': 'İsim yok',

      // Reader
      'translate': 'Çevir',
      'translation': 'Çevirisi',
      'translation_not_found': 'Çeviri bulunamadı',
      'exit': 'Çıkış',
      'save_reading_position_message': 'Kaldığın yeri kaydetmek ister misin?',
      'save_book': 'Kitap Kaydet',
      'save_book_message':
          'Kitap kitaplıkta kayıtlı değil, eklemek ister misiniz?',

      // About
      'polread_desc':
          'PolyRead; kitap okumayı daha düzenli, keyifli ve verimli hale getirmek için tasarlanmış modern bir e-kitap okuyucu ve dijital kütüphane uygulamasıdır.',
      'app_view_description':
          'PolyRead; kitap okumayı daha düzenli, keyifli ve verimli hale getirmek için tasarlanmış modern bir e-kitap okuyucu ve dijital kütüphane uygulamasıdır. Tüm kitaplarını tek yerde toplayabilir, kolayca okuyabilir, ilerlemeni takip edebilir ve günlük okuma alışkanlığı oluşturabilirsin. 📚 Gelişmiş Kitap Okuma Deneyimi EPUB ve dijital kitaplarını rahatça görüntüle. Akıcı ve modern okuma ekranı ile dikkat dağıtmayan deneyim sunar. Kaldığın yerden devam etme özelliği ve otomatik okuma ilerleme kaydı vardır. 📖 Dijital Kütüphaneni Oluştur Tüm kitaplarını tek yerde organize et, kişisel kitap arşivini oluştur, kitaplarını kolayca kategorize et ve yönet. 📈 Okuma Takibi ve Motivasyon Okuma ilerlemeni takip et, günlük okuma alışkanlığı kazan ve daha disiplinli bir şekilde hedeflerine ulaş.',
    },
    'en': {
      // General/Global
      'success': 'Success',
      'error': 'Error',
      'warning': 'Warning',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'search': 'Search...',
      'all': 'All',
      'cancel': 'Cancel',
      'yes': 'Yes',
      'no': 'No',
      'successful': 'Successful',
      'connecting': 'Connecting...',
      'scanning_databases': 'Scanning databases...',
      'analyzing_content': 'Analyzing content...',
      'gathering_data': 'Gathering information...',
      'finalizing_setup': 'Finalizing setup...',
      'tag_helper_text': 'Press Enter to add a tag',
      'tag_hint': 'Add tag...',
      'retry': 'Retry',
      'image_capture_failed': 'Image could not be captured',
      'image_conversion_failed': 'Image could not be converted',
      'share_failed_detail': 'Share failed: @error',
      'language_not_found': 'Language information not found',
      'tts_error_detail': 'Speech error: @message',
      'tts_start_failed': 'Speech could not be started',
      'unsupported_language': 'Unsupported language: @language',

      // Home & Navigation
      'library': 'Library',
      'my_books': 'My Books',
      'my_words': 'Vocabulary',
      'recently_opened': 'Recently Opened',
      'update_available_title': 'New Update Available!',
      'update_available_body':
          'A new version of the app is available.\nPlease update the app for a better experience.\n\nCurrent Version: @current\nNew Version: @new',
      'later': 'Later',
      'update': 'Update',

      // Profile Page
      'profile': 'Profile',
      'reading_time_badges': 'Reading Time Badges',
      'streak_badges': 'Streak Badges',
      'reading_average': 'Reading Average',
      'longest_streak': 'Longest Streak',
      'min_per_day': 'min/day',
      'days': 'days',
      'badge_earned_starter': 'Starter',
      'badge_earned_determined': 'Determined',
      'badge_earned_bookworm': 'Bookworm',
      'badge_earned_legend': 'Legend',
      'badge_streak_warmup': 'Warm-up',
      'badge_streak_disciplined': 'Disciplined',
      'badge_streak_addicted': 'Addicted',
      'badge_streak_legend': 'Legend',
      'language_settings': 'Language Settings',
      'select_language': 'Select Language',

      // Library / Book Detail Page
      'no_results': 'No results found',
      'no_books': 'No books found',
      'categories': 'Categories',
      'languages': 'Languages',
      'book': 'Book',
      'book_not_found': 'Selected book not found',
      'book_not_found_message': 'Book not found',
      'downloaded_count': '@count Downloads',
      'read': 'Read',
      'download': 'Download',
      'summary': 'Summary',
      'add_book': 'Add Book',
      'general_error_message': 'Something went wrong, please try again later!',
      'download_error_message':
          'An error occurred during download, please try again later',

      // Categories (Static lists)
      'category_children': 'Children',
      'category_adventure': 'Adventure',
      'category_sci_fi': 'Science Fiction',
      'category_education': 'Education',
      'category_biographies': 'Biographies',
      'category_philosophy': 'Philosophy',

      // Progress Status
      'status_not_started': 'Not Started',
      'status_continuing': 'In Progress',
      'status_done': 'Completed',

      // Edit Book Metadata Page
      'edit_book': 'Edit Book',
      'edit_tag': 'Edit Tags',
      'click_to_select_cover': 'Click to Select Cover',
      'book_title': 'Book Title',
      'enter_book_title': 'Enter book title',
      'book_title_required': 'Book title cannot be empty',
      'authors': 'Authors',
      'add_new_author': 'Add new author',
      'add_author': 'Add Author',
      'language': 'Language',

      // Vocabulary History Page
      'vocabulary_history': 'Vocabulary History',
      'no_saved_words': 'No saved words yet.',
      'show_recommended_app': 'Show Recommended App',
      'recommended_app_title': 'English Questions',
      'recommended_app_desc': 'Download for vocabulary tests!',
      'hide': 'Hide',
      'no_words_in_language': 'No saved words in this language.',
      'read_slowly': 'Read Slowly',
      'read_normally': 'Read Normally',
      'learned': 'Learned',
      'word_saved_to_history': 'Saved to vocabulary.',
      'word_removed_from_history': 'Removed from vocabulary.',
      'tts_error': 'Text-to-speech error',
      'asset_load_error': 'Error loading asset book',

      // Notes (Postscript) Pages
      'my_notes': 'My Notes',
      'note': 'Note',
      'note_prefix': 'Note: @note',
      'note_write_here': 'Write your note...',
      'color': 'Color',
      'tags': 'Tags',
      'underline': 'Underline',
      'edit_note': 'Edit Note',
      'add_note': 'Add Note',
      'notes_and_highlights': 'Notes and Highlights',
      'no_notes_saved_for_book': 'There are no notes saved for this book.',

      // Sharing
      'share_quote': 'Share Quote',
      'share': 'Share',
      'format_uppercase': 'FORMAT',
      'text_uppercase': 'TEXT',
      'font_size_uppercase': 'FONT SIZE',
      'background_uppercase': 'BACKGROUND',
      'bold': 'Bold',
      'underline_option': 'Underline',
      'select_text_color': 'Select Text Color',
      'select_card_color': 'Select Card Color',
      'earned_new_badges': 'I earned new badges!',
      'shared_with_polyread': 'Shared via Polyread',
      'share_badge': 'Share Badge',

      // Drawer
      'chapters': 'Chapters',
      'chapters_count': '@count chapters',
      'search_chapters': 'Search chapters...',
      'chapter_not_found': 'Chapter not found',
      'could_not_navigate_chapter': 'Could not navigate to chapter',

      // Notification Service
      'quote_of_the_day': 'Quote of the Day',
      'reading_is_beautiful': 'Reading is beautiful.',

      // Languages
      'lang_tr': 'Turkish',
      'lang_en': 'English',
      'lang_es': 'Spanish',
      'lang_fr': 'French',
      'lang_de': 'German',
      'lang_it': 'Italian',
      'settings': 'Settings',
      'font_size': 'Font Size',
      'go_to_last_saved_page': 'Go to Last Saved Page',
      'no_books_opened': 'No books opened yet',
      'no_name': 'No name',

      // Reader
      'translate': 'Translate',
      'translation': 'Translation',
      'translation_not_found': 'Translation not found',
      'exit': 'Exit',
      'save_reading_position_message':
          'Do you want to save your reading position?',
      'save_book': 'Save Book',
      'save_book_message':
          'This book is not in your library, do you want to add it?',

      // About
      'polread_desc':
          'PolyRead is a modern e-book reader and digital library app designed to make reading more organized, enjoyable, and productive.',
      'app_view_description':
          'PolyRead helps you read more regularly, enjoyably, and productively with a modern e-book reader and digital library experience. Keep all your books in one place, read easily, track your progress, and build a daily reading habit. 📚 Advanced Reading Experience View EPUBs and digital books comfortably with a smooth and modern reading interface that keeps distractions away. Continue from where you left off. Automatic reading progress tracking. 📖 Build Your Digital Library Organize all your books in one place. Create your personal book archive. Categorize and manage your books easily. 📈 Reading Tracking and Motivation Track your reading progress. Build a daily reading habit. Reach your goals with more discipline.',
    },
    'es': {
      // General/Global
      'success': 'Éxito',
      'error': 'Error',
      'warning': 'Advertencia',
      'save': 'Guardar',
      'delete': 'Eliminar',
      'edit': 'Editar',
      'search': 'Buscar...',
      'all': 'Todos',
      'cancel': 'Cancelar',
      'yes': 'Sí',
      'no': 'No',
      'successful': 'Exitoso',
      'connecting': 'Conectando...',
      'scanning_databases': 'Escaneando bases de datos...',
      'analyzing_content': 'Analizando contenido...',
      'gathering_data': 'Recopilando información...',
      'finalizing_setup': 'Finalizando configuración...',
      'tag_helper_text': 'Presiona Enter para agregar una etiqueta',
      'tag_hint': 'Etiqueta...',
      'retry': 'Reintentar',
      'image_capture_failed': 'No se pudo capturar la imagen',
      'image_conversion_failed': 'No se pudo convertir la imagen',
      'share_failed_detail': 'No se pudo compartir: @error',
      'language_not_found': 'No se encontró la información del idioma',
      'tts_error_detail': 'Error de voz: @message',
      'tts_start_failed': 'No se pudo iniciar la reproducción',
      'unsupported_language': 'Idioma no compatible: @language',

      // Home & Navigation
      'library': 'Biblioteca',
      'my_books': 'Mis Libros',
      'my_words': 'Vocabulario',
      'recently_opened': 'Abierto Recientemente',
      'update_available_title': '¡Nueva actualización disponible!',
      'update_available_body':
          'Una nueva versión de la aplicación está disponible.\nPor favor, actualice la aplicación para una mejor experiencia.\n\nVersión actual: @current\nNueva versión: @new',
      'later': 'Más tarde',
      'update': 'Actualizar',

      // Profile Page
      'profile': 'Perfil',
      'reading_time_badges': 'Insignias de Tiempo de Lectura',
      'streak_badges': 'Insignias de Racha',
      'reading_average': 'Promedio de Lectura',
      'longest_streak': 'Racha Más Larga',
      'min_per_day': 'min/día',
      'days': 'días',
      'badge_earned_starter': 'Principiante',
      'badge_earned_determined': 'Determinado',
      'badge_earned_bookworm': 'Ratón de Biblioteca',
      'badge_earned_legend': 'Leyenda',
      'badge_streak_warmup': 'Calentamiento',
      'badge_streak_disciplined': 'Disciplinado',
      'badge_streak_addicted': 'Adicto',
      'badge_streak_legend': 'Leyenda',
      'language_settings': 'Ajustes de Idioma',
      'select_language': 'Seleccionar Idioma',

      // Library / Book Detail Page
      'no_results': 'No se encontraron resultados',
      'no_books': 'No se encontraron libros',
      'categories': 'Categorías',
      'languages': 'Idiomas',
      'book': 'Libro',
      'book_not_found': 'Libro seleccionado no encontrado',
      'book_not_found_message': 'Libro no encontrado',
      'downloaded_count': '@count Descargas',
      'read': 'Leer',
      'download': 'Descargar',
      'summary': 'Resumen',
      'add_book': 'Agregar Libro',
      'general_error_message':
          '¡Algo salió mal, por favor inténtelo de nuevo más tarde!',
      'download_error_message':
          'Error al descargar, por favor inténtelo de nuevo más tarde',

      // Categories (Static lists)
      'category_children': 'Infantil',
      'category_adventure': 'Aventura',
      'category_sci_fi': 'Ciencia Ficción',
      'category_education': 'Educación',
      'category_biographies': 'Biografías',
      'category_philosophy': 'Filosofía',

      // Progress Status
      'status_not_started': 'No Iniciado',
      'status_continuing': 'En Progreso',
      'status_done': 'Completado',

      // Edit Book Metadata Page
      'edit_book': 'Editar Libro',
      'edit_tag': 'Editar Etiquetas',
      'click_to_select_cover': 'Clic para Seleccionar Portada',
      'book_title': 'Título del Libro',
      'enter_book_title': 'Ingrese el título del libro',
      'book_title_required': 'El título del libro no puede estar vacío',
      'authors': 'Autores',
      'add_new_author': 'Agregar nuevo autor',
      'add_author': 'Agregar Autor',
      'language': 'Idioma',

      // Vocabulary History Page
      'vocabulary_history': 'Historial de Vocabulario',
      'no_saved_words': 'Aún no hay palabras guardadas.',
      'show_recommended_app': 'Mostrar Aplicación Recomendada',
      'recommended_app_title': 'Preguntas en Inglés',
      'recommended_app_desc': '¡Descárguelo para pruebas de vocabulario!',
      'hide': 'Ocultar',
      'no_words_in_language': 'No hay palabras guardadas en este idioma.',
      'read_slowly': 'Leer Lentamente',
      'read_normally': 'Leer Normalmente',
      'learned': 'Aprendido',
      'word_saved_to_history': 'Guardado en el vocabulario.',
      'word_removed_from_history': 'Eliminado del vocabulario.',
      'tts_error': 'Error de síntesis de voz',
      'asset_load_error': 'Error al cargar el libro de activos',

      // Notes (Postscript) Pages
      'my_notes': 'Mis Notas',
      'note': 'Nota',
      'note_prefix': 'Nota: @note',
      'note_write_here': 'Escriba su nota...',
      'color': 'Color',
      'tags': 'Etiquetas',
      'underline': 'Subrayado',
      'edit_note': 'Editar Nota',
      'add_note': 'Agregar Nota',
      'notes_and_highlights': 'Notas y Destacados',
      'no_notes_saved_for_book': 'No hay notas guardadas para este libro.',

      // Sharing
      'share_quote': 'Compartir Cita',
      'share': 'Compartir',
      'format_uppercase': 'FORMATO',
      'text_uppercase': 'TEXTO',
      'font_size_uppercase': 'TAMAÑO DE FUENTE',
      'background_uppercase': 'FONDO',
      'bold': 'Negrita',
      'underline_option': 'Subrayado',
      'select_text_color': 'Seleccionar Color del Texto',
      'select_card_color': 'Seleccionar Color de Tarjeta',
      'earned_new_badges': '¡He ganado nuevas insignias!',
      'shared_with_polyread': 'Compartido con Polyread',
      'share_badge': 'Compartir Insignia',

      // Drawer
      'chapters': 'Capítulos',
      'chapters_count': '@count capítulos',
      'search_chapters': 'Buscar capítulos...',
      'chapter_not_found': 'Capítulo no encontrado',
      'could_not_navigate_chapter': 'No se pudo ir al capítulo',

      // Notification Service
      'quote_of_the_day': 'Frase del Día',
      'reading_is_beautiful': 'Leer es hermoso.',

      // Languages
      'lang_tr': 'Turco',
      'lang_en': 'Inglés',
      'lang_es': 'Español',
      'lang_fr': 'Francés',
      'lang_de': 'Alemán',
      'lang_it': 'Italiano',
      'settings': 'Ajustes',
      'font_size': 'Tamaño de fuente',
      'go_to_last_saved_page': 'Ir a la última página guardada',
      'no_books_opened': 'Aún no se han abierto libros',
      'no_name': 'Sin nombre',

      // Reader
      'translate': 'Traducir',
      'translation': 'Traducción',
      'translation_not_found': 'Traducción no encontrada',
      'exit': 'Salir',
      'save_reading_position_message': '¿Desea guardar su posición de lectura?',
      'save_book': 'Guardar Libro',
      'save_book_message':
          'Este libro no está en su biblioteca, ¿desea agregarlo?',

      // About
      'polread_desc':
          'PolyRead es una aplicación moderna de lectura de libros electrónicos y biblioteca digital diseñada para hacer la lectura más organizada, agradable y productiva.',
      'app_view_description':
          'PolyRead te ayuda a leer de forma más regular, agradable y productiva con una moderna aplicación de lectura de ebooks y biblioteca digital. Mantén todos tus libros en un solo lugar, lee con facilidad, sigue tu progreso y crea un hábito diario de lectura. 📚 Experiencia avanzada de lectura Visualiza EPUB y libros digitales con comodidad mediante una interfaz de lectura fluida y moderna, sin distracciones. Continúa desde donde lo dejaste. Seguimiento automático del progreso de lectura. 📖 Crea tu biblioteca digital Organiza todos tus libros en un solo lugar. Crea tu archivo personal de libros. Categoriza y gestiona tus libros fácilmente. 📈 Seguimiento y motivación de la lectura Sigue tu progreso de lectura. Crea un hábito diario de lectura. Alcanzar tus metas con más disciplina.',
    },
    'fr': {
      // General/Global
      'success': 'Succès',
      'error': 'Erreur',
      'warning': 'Avertissement',
      'save': 'Enregistrer',
      'delete': 'Supprimer',
      'edit': 'Modifier',
      'search': 'Rechercher...',
      'all': 'Tout',
      'cancel': 'Annuler',
      'yes': 'Oui',
      'no': 'Non',
      'successful': 'Succès',
      'connecting': 'Connexion en cours...',
      'scanning_databases': 'Analyse des bases de données...',
      'analyzing_content': 'Analyse du contenu...',
      'gathering_data': 'Rassemblement des informations...',
      'finalizing_setup': 'Finalisation de la configuration...',
      'tag_helper_text': 'Appuyez sur Entrée pour ajouter une étiquette',
      'tag_hint': 'Étiquette...',
      'retry': 'Réessayer',
      'image_capture_failed': 'Impossible de capturer l\'image',
      'image_conversion_failed': 'Impossible de convertir l\'image',
      'share_failed_detail': 'Le partage a échoué : @error',
      'language_not_found': 'Informations linguistiques introuvables',
      'tts_error_detail': 'Erreur de synthèse vocale : @message',
      'tts_start_failed': 'Impossible de démarrer la synthèse vocale',
      'unsupported_language': 'Langue non prise en charge : @language',

      // Home & Navigation
      'library': 'Bibliothèque',
      'my_books': 'Mes Livres',
      'my_words': 'Vocabulaire',
      'recently_opened': 'Récemment Ouvert',
      'update_available_title': 'Nouvelle mise à jour disponible !',
      'update_available_body':
          'Une nouvelle version de l\'application est disponible.\nVeuillez mettre à jour l\'application pour une meilleure expérience.\n\nVersion actuelle: @current\nNouvelle version: @new',
      'later': 'Plus tard',
      'update': 'Mettre à jour',

      // Profile Page
      'profile': 'Profil',
      'reading_time_badges': 'Badges de Temps de Lecture',
      'streak_badges': 'Badges de Série',
      'reading_average': 'Moyenne de Lecture',
      'longest_streak': 'Plus Longue Série',
      'min_per_day': 'min/jour',
      'days': 'jours',
      'badge_earned_starter': 'Débutant',
      'badge_earned_determined': 'Déterminé',
      'badge_earned_bookworm': 'Rat de Bibliothèque',
      'badge_earned_legend': 'Légende',
      'badge_streak_warmup': 'Échauffement',
      'badge_streak_disciplined': 'Discipliné',
      'badge_streak_addicted': 'Accro',
      'badge_streak_legend': 'Légende',
      'language_settings': 'Paramètres de Langue',
      'select_language': 'Choisir la Langue',

      // Library / Book Detail Page
      'no_results': 'Aucun résultat trouvé',
      'no_books': 'Aucun livre trouvé',
      'categories': 'Catégories',
      'languages': 'Langues',
      'book': 'Livre',
      'book_not_found': 'Livre sélectionné introuvable',
      'book_not_found_message': 'Livre introuvable',
      'downloaded_count': '@count Téléchargements',
      'read': 'Lire',
      'download': 'Télécharger',
      'summary': 'Résumé',
      'add_book': 'Ajouter un Livre',
      'general_error_message':
          'Une erreur s\'est produite, veuillez réessayer plus tard !',
      'download_error_message':
          'Erreur lors du téléchargement, veuillez réessayer plus tard',

      // Categories (Static lists)
      'category_children': 'Enfant',
      'category_adventure': 'Aventure',
      'category_sci_fi': 'Science-Fiction',
      'category_education': 'Éducation',
      'category_biographies': 'Biographies',
      'category_philosophy': 'Philosophie',

      // Progress Status
      'status_not_started': 'Non Commencé',
      'status_continuing': 'En Cours',
      'status_done': 'Terminé',

      // Edit Book Metadata Page
      'edit_book': 'Modifier le Livre',
      'edit_tag': 'Modifier les Étiquettes',
      'click_to_select_cover': 'Cliquez pour Sélectionner la Couverture',
      'book_title': 'Titre du Livre',
      'enter_book_title': 'Saisissez le titre du livre',
      'book_title_required': 'Le titre du livre ne peut pas être vide',
      'authors': 'Auteurs',
      'add_new_author': 'Ajouter un nouvel auteur',
      'add_author': 'Ajouter l\'Auteur',
      'language': 'Langue',

      // Vocabulary History Page
      'vocabulary_history': 'Historique du Vocabulaire',
      'no_saved_words': 'Aucun mot enregistré pour le moment.',
      'show_recommended_app': 'Afficher l\'Application Recommandée',
      'recommended_app_title': 'Questions en Anglais',
      'recommended_app_desc': 'Téléchargez pour des tests de vocabulaire !',
      'hide': 'Masquer',
      'no_words_in_language': 'Aucun mot enregistré dans cette langue.',
      'read_slowly': 'Lire Lentement',
      'read_normally': 'Lire Normalement',
      'learned': 'Appris',
      'word_saved_to_history': 'Enregistré dans le vocabulaire.',
      'word_removed_from_history': 'Retiré du vocabulaire.',
      'tts_error': 'Erreur de synthèse vocale',
      'asset_load_error': 'Erreur lors du chargement du livre d\'actifs',

      // Notes (Postscript) Pages
      'my_notes': 'Mes Notes',
      'note': 'Note',
      'note_prefix': 'Note: @note',
      'note_write_here': 'Écrivez votre note...',
      'color': 'Couleur',
      'tags': 'Étiquettes',
      'underline': 'Souligné',
      'edit_note': 'Modifier la Note',
      'add_note': 'Ajouter une Note',
      'notes_and_highlights': 'Notes et Surbrillances',
      'no_notes_saved_for_book': 'Aucune note enregistrée pour ce livre.',

      // Sharing
      'share_quote': 'Partager la Citation',
      'share': 'Partager',
      'format_uppercase': 'FORMAT',
      'text_uppercase': 'TEXTE',
      'font_size_uppercase': 'TAILLE DE POLICE',
      'background_uppercase': 'ARRIÈRE-PLAN',
      'bold': 'Gras',
      'underline_option': 'Souligné',
      'select_text_color': 'Sélectionner la Couleur du Texte',
      'select_card_color': 'Sélectionner la Couleur de la Carte',
      'earned_new_badges': 'J\'ai gagné de nouveaux badges !',
      'shared_with_polyread': 'Partagé avec Polyread',
      'share_badge': 'Partager le Badge',

      // Drawer
      'chapters': 'Chapitres',
      'chapters_count': '@count chapitres',
      'search_chapters': 'Rechercher dans les chapitres...',
      'chapter_not_found': 'Chapitre introuvable',
      'could_not_navigate_chapter': 'Impossible d\'accéder au chapitre',

      // Notification Service
      'quote_of_the_day': 'Citation du Jour',
      'reading_is_beautiful': 'Lire est magnifique.',

      // Languages
      'lang_tr': 'Turc',
      'lang_en': 'Anglais',
      'lang_es': 'Espagnol',
      'lang_fr': 'Francais',
      'lang_de': 'Allemand',
      'lang_it': 'Italien',
      'settings': 'Paramètres',
      'font_size': 'Taille de police',
      'go_to_last_saved_page': 'Aller à la dernière page enregistrée',
      'no_books_opened': 'Aucun livre ouvert pour le moment',
      'no_name': 'Sans nom',

      // Reader
      'translate': 'Traduire',
      'translation': 'Traduction',
      'translation_not_found': 'Traduction introuvable',
      'exit': 'Quitter',
      'save_reading_position_message':
          'Voulez-vous enregistrer votre position de lecture ?',
      'save_book': 'Enregistrer le Livre',
      'save_book_message':
          'Ce livre n\'est pas dans votre bibliothèque, voulez-vous l\'ajouter ?',

      // About
      'polread_desc':
          'PolyRead est une application moderne de lecture et de bibliothèque numérique conçue pour rendre la lecture plus organisée, agréable et productive.',
    },
    'it': {
      // General/Global
      'success': 'Successo',
      'error': 'Errore',
      'warning': 'Avviso',
      'save': 'Salva',
      'delete': 'Elimina',
      'edit': 'Modifica',
      'search': 'Cerca...',
      'all': 'Tutto',
      'cancel': 'Annulla',
      'yes': 'Sì',
      'no': 'No',
      'successful': 'Riuscito',
      'connecting': 'Connessione in corso...',
      'scanning_databases': 'Scansione dei database...',
      'analyzing_content': 'Analisi del contenuto...',
      'gathering_data': 'Raccolta informazioni...',
      'finalizing_setup': 'Completamento della configurazione...',
      'tag_helper_text': 'Premi Invio per aggiungere un tag',
      'tag_hint': 'Tag...',
      'retry': 'Riprova',
      'image_capture_failed': 'Impossibile acquisire l\'immagine',
      'image_conversion_failed': 'Impossibile convertire l\'immagine',
      'share_failed_detail': 'Condivisione non riuscita: @error',
      'language_not_found': 'Informazioni sulla lingua non trovate',
      'tts_error_detail': 'Errore di sintesi vocale: @message',
      'tts_start_failed': 'Impossibile avviare la sintesi vocale',
      'unsupported_language': 'Lingua non supportata: @language',

      // Home & Navigation
      'library': 'Libreria',
      'my_books': 'I Miei Libri',
      'my_words': 'Vocabolario',
      'recently_opened': 'Aperti Di Recente',
      'update_available_title': 'Nuovo aggiornamento disponibile!',
      'update_available_body':
          'È disponibile una nuova versione dell\'app.\nAggiorna l\'app per un\'esperienza migliore.\n\nVersione attuale: @current\nNuova versione: @new',
      'later': 'Più tardi',
      'update': 'Aggiorna',

      // Profile Page
      'profile': 'Profilo',
      'reading_time_badges': 'Badge di Tempo di Lettura',
      'streak_badges': 'Badge di Serie',
      'reading_average': 'Media di Lettura',
      'longest_streak': 'Serie Più Lunga',
      'min_per_day': 'min/giorno',
      'days': 'giorni',
      'badge_earned_starter': 'Principiante',
      'badge_earned_determined': 'Determinato',
      'badge_earned_bookworm': 'Bookworm',
      'badge_earned_legend': 'Legenda',
      'badge_streak_warmup': 'Riscaldamento',
      'badge_streak_disciplined': 'Disciplinato',
      'badge_streak_addicted': 'Dipendente',
      'badge_streak_legend': 'Legenda',
      'language_settings': 'Impostazioni Lingua',
      'select_language': 'Seleziona Lingua',

      // Library / Book Detail Page
      'no_results': 'Nessun risultato trovato',
      'no_books': 'Nessun libro trovato',
      'categories': 'Categorie',
      'languages': 'Lingue',
      'book': 'Libro',
      'book_not_found': 'Libro selezionato non trovato',
      'book_not_found_message': 'Libro non trovato',
      'downloaded_count': '@count download',
      'read': 'Leggi',
      'download': 'Scarica',
      'summary': 'Riepilogo',
      'add_book': 'Aggiungi Libro',
      'general_error_message': 'Si è verificato un errore, riprova più tardi!',
      'download_error_message':
          'Si è verificato un errore durante il download, riprova più tardi',

      // Categories (Static lists)
      'category_children': 'Bambini',
      'category_adventure': 'Avventura',
      'category_sci_fi': 'Fantascienza',
      'category_education': 'Educazione',
      'category_biographies': 'Biografie',
      'category_philosophy': 'Filosofia',

      // Progress Status
      'status_not_started': 'Non Iniziato',
      'status_continuing': 'In Corso',
      'status_done': 'Completato',

      // Edit Book Metadata Page
      'edit_book': 'Modifica Libro',
      'edit_tag': 'Modifica Tag',
      'click_to_select_cover': 'Fai clic per selezionare la copertina',
      'book_title': 'Titolo del Libro',
      'enter_book_title': 'Inserisci il titolo del libro',
      'book_title_required': 'Il titolo del libro non può essere vuoto',
      'authors': 'Autori',
      'add_new_author': 'Aggiungi nuovo autore',
      'add_author': 'Aggiungi Autore',
      'language': 'Lingua',

      // Vocabulary History Page
      'vocabulary_history': 'Cronologia del Vocabolario',
      'no_saved_words': 'Nessuna parola salvata ancora.',
      'show_recommended_app': 'Mostra App Consigliata',
      'recommended_app_title': 'Domande in Inglese',
      'recommended_app_desc': 'Scarica per test di vocabolario!',
      'hide': 'Nascondi',
      'no_words_in_language': 'Nessuna parola salvata in questa lingua.',
      'read_slowly': 'Leggi lentamente',
      'read_normally': 'Leggi normalmente',
      'learned': 'Imparato',
      'word_saved_to_history': 'Salvato nel vocabolario.',
      'word_removed_from_history': 'Rimosso dal vocabolario.',
      'tts_error': 'Errore di sintesi vocale',
      'asset_load_error': 'Errore durante il caricamento del libro asset',

      // Notes (Postscript) Pages
      'my_notes': 'Le Mie Note',
      'note': 'Nota',
      'note_prefix': 'Nota: @note',
      'note_write_here': 'Scrivi la tua nota...',
      'color': 'Colore',
      'tags': 'Tag',
      'underline': 'Sottolinea',
      'edit_note': 'Modifica Nota',
      'add_note': 'Aggiungi Nota',
      'notes_and_highlights': 'Note e Evidenziazioni',
      'no_notes_saved_for_book': 'Non ci sono note salvate per questo libro.',

      // Sharing
      'share_quote': 'Condividi Citazione',
      'share': 'Condividi',
      'format_uppercase': 'FORMATO',
      'text_uppercase': 'TESTO',
      'font_size_uppercase': 'DIMENSIONE FONT',
      'background_uppercase': 'SFONDO',
      'bold': 'Grassetto',
      'underline_option': 'Sottolinea',
      'select_text_color': 'Seleziona Colore del Testo',
      'select_card_color': 'Seleziona Colore della Scheda',
      'earned_new_badges': 'Ho ottenuto nuovi badge!',
      'shared_with_polyread': 'Condiviso con Polyread',
      'share_badge': 'Condividi Badge',

      // Drawer
      'chapters': 'Capitoli',
      'chapters_count': '@count capitoli',
      'search_chapters': 'Cerca nei capitoli...',
      'chapter_not_found': 'Capitolo non trovato',
      'could_not_navigate_chapter': 'Impossibile aprire il capitolo',

      // Notification Service
      'quote_of_the_day': 'Citazione del Giorno',
      'reading_is_beautiful': 'Leggere è bello.',

      // Languages
      'lang_tr': 'Turco',
      'lang_en': 'Inglese',
      'lang_es': 'Spagnolo',
      'lang_fr': 'Francese',
      'lang_de': 'Tedesco',
      'lang_it': 'Italiano',
      'settings': 'Impostazioni',
      'font_size': 'Dimensione Font',
      'go_to_last_saved_page': 'Vai all\'ultima pagina salvata',
      'no_books_opened': 'Nessun libro aperto ancora',
      'no_name': 'Nessun nome',

      // Reader
      'translate': 'Traduci',
      'translation': 'Traduzione',
      'translation_not_found': 'Traduzione non trovata',
      'exit': 'Esci',
      'save_reading_position_message':
          'Vuoi salvare la tua posizione di lettura?',
      'save_book': 'Salva Libro',
      'save_book_message':
          'Questo libro non è nella tua libreria, vuoi aggiungerlo?',

      // About
      'polread_desc':
          'PolyRead è una moderna app di lettura e libreria digitale progettata per rendere la lettura più organizzata, piacevole e produttiva.',
    },
    'de': {
      // General/Global
      'success': 'Erfolgreich',
      'error': 'Fehler',
      'warning': 'Warnung',
      'save': 'Speichern',
      'delete': 'Löschen',
      'edit': 'Bearbeiten',
      'search': 'Suchen...',
      'all': 'Alle',
      'cancel': 'Abbrechen',
      'yes': 'Ja',
      'no': 'Nein',
      'successful': 'Erfolgreich',
      'connecting': 'Verbindung wird hergestellt...',
      'scanning_databases': 'Datenbanken werden gescannt...',
      'analyzing_content': 'Inhalt wird analysiert...',
      'gathering_data': 'Informationen werden zusammengestellt...',
      'finalizing_setup': 'Letzte Konfiguration wird abgeschlossen...',
      'tag_helper_text': 'Drücken Sie Enter, um ein Tag hinzuzufügen',
      'tag_hint': 'Tag...',
      'retry': 'Erneut versuchen',
      'image_capture_failed': 'Bild konnte nicht abgerufen werden',
      'image_conversion_failed': 'Bild konnte nicht konvertiert werden',
      'share_failed_detail': 'Freigabe fehlgeschlagen: @error',
      'language_not_found': 'Sprachinformationen nicht gefunden',
      'tts_error_detail': 'Sprachfehler: @message',
      'tts_start_failed': 'Sprachausgabe konnte nicht gestartet werden',
      'unsupported_language': 'Nicht unterstützte Sprache: @language',

      // Home & Navigation
      'library': 'Bibliothek',
      'my_books': 'Meine Bücher',
      'my_words': 'Wortschatz',
      'recently_opened': 'Zuletzt Geöffnet',
      'update_available_title': 'Neues Update verfügbar!',
      'update_available_body':
          'Eine neue Version der App ist verfügbar.\nBitte aktualisieren Sie die App für eine bessere Erfahrung.\n\nAktuelle Version: @current\nNeue Version: @new',
      'later': 'Später',
      'update': 'Aktualisieren',

      // Profile Page
      'profile': 'Profil',
      'reading_time_badges': 'Lesezeit-Abzeichen',
      'streak_badges': 'Serien-Abzeichen',
      'reading_average': 'Lesedurchschnitt',
      'longest_streak': 'Längste Serie',
      'min_per_day': 'Min./Tag',
      'days': 'Tage',
      'badge_earned_starter': 'Anfänger',
      'badge_earned_determined': 'Zielstrebig',
      'badge_earned_bookworm': 'Bücherwurm',
      'badge_earned_legend': 'Legende',
      'badge_streak_warmup': 'Aufwärmen',
      'badge_streak_disciplined': 'Diszipliniert',
      'badge_streak_addicted': 'Süchtig',
      'badge_streak_legend': 'Legende',
      'language_settings': 'Spracheinstellungen',
      'select_language': 'Sprache Wählen',

      // Library / Book Detail Page
      'no_results': 'Keine Ergebnisse gefunden',
      'no_books': 'Keine Bücher gefunden',
      'categories': 'Kategorien',
      'languages': 'Sprachen',
      'book': 'Buch',
      'book_not_found': 'Ausgewähltes Buch nicht gefunden',
      'book_not_found_message': 'Buch nicht gefunden',
      'downloaded_count': '@count Mal heruntergeladen',
      'read': 'Lesen',
      'download': 'Herunterladen',
      'summary': 'Zusammenfassung',
      'add_book': 'Buch Hinzufügen',
      'general_error_message':
          'Es ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut!',
      'download_error_message':
          'Fehler beim Herunterladen, bitte versuchen Sie es später erneut',

      // Categories (Static lists)
      'category_children': 'Kinder',
      'category_adventure': 'Abenteuer',
      'category_sci_fi': 'Science-Fiction',
      'category_education': 'Bildung',
      'category_biographies': 'Biografien',
      'category_philosophy': 'Philosophie',

      // Progress Status
      'status_not_started': 'Nicht Begonnen',
      'status_continuing': 'In Bearbeitung',
      'status_done': 'Beendet',

      // Edit Book Metadata Page
      'edit_book': 'Buch Bearbeiten',
      'edit_tag': 'Tags Bearbeiten',
      'click_to_select_cover': 'Klicken, um Cover auszuwählen',
      'book_title': 'Buchtitel',
      'enter_book_title': 'Buchtitel eingeben',
      'book_title_required': 'Buchtitel darf nicht leer sein',
      'authors': 'Autoren',
      'add_new_author': 'Neuen Autor hinzufügen',
      'add_author': 'Autor Hinzufügen',
      'language': 'Sprache',

      // Vocabulary History Page
      'vocabulary_history': 'Wortschatz-Verlauf',
      'no_saved_words': 'Noch keine gespeicherten Wörter.',
      'show_recommended_app': 'Empfohlene App Anzeigen',
      'recommended_app_title': 'Englisch-Fragen',
      'recommended_app_desc': 'Für Vokabeltests herunterladen!',
      'hide': 'Ausblenden',
      'no_words_in_language': 'Keine gespeicherten Wörter in dieser Sprache.',
      'read_slowly': 'Langsam Lesen',
      'read_normally': 'Normal Lesen',
      'learned': 'Gelernt',
      'word_saved_to_history': 'Im Wortschatz gespeichert.',
      'word_removed_from_history': 'Aus dem Wortschatz entfernt.',
      'tts_error': 'Sprachsynthese-Fehler',
      'asset_load_error': 'Fehler beim Laden des Asset-Buchs',

      // Notes (Postscript) Pages
      'my_notes': 'Meine Notizen',
      'note': 'Notiz',
      'note_prefix': 'Notiz: @note',
      'note_write_here': 'Schreiben Sie Ihre Notiz...',
      'color': 'Farbe',
      'tags': 'Tags',
      'underline': 'Unterstreichung',
      'edit_note': 'Notiz Bearbeiten',
      'add_note': 'Notiz Hinzufügen',
      'notes_and_highlights': 'Notizen und Highlights',
      'no_notes_saved_for_book': 'Keine gespeicherten Notizen für dieses Buch.',

      // Sharing
      'share_quote': 'Zitat Teilen',
      'share': 'Teilen',
      'format_uppercase': 'FORMAT',
      'text_uppercase': 'TEXT',
      'font_size_uppercase': 'SCHRIFTGRÖSSE',
      'background_uppercase': 'HINTERGRUND',
      'bold': 'Fett',
      'underline_option': 'Unterstreichung',
      'select_text_color': 'Textfarbe Wählen',
      'select_card_color': 'Kartenfarbe Wählen',
      'earned_new_badges': 'Ich habe neue Abzeichen erhalten!',
      'shared_with_polyread': 'Mit Polyread geteilt',
      'share_badge': 'Abzeichen Teilen',

      // Drawer
      'chapters': 'Kapitel',
      'chapters_count': '@count Kapitel',
      'search_chapters': 'In Kapiteln suchen...',
      'chapter_not_found': 'Kapitel nicht gefunden',
      'could_not_navigate_chapter':
          'Verbindung zum Kapitel konnte nicht hergestellt werden',

      // Notification Service
      'quote_of_the_day': 'Zitat des Tages',
      'reading_is_beautiful': 'Lesen ist schön.',

      // Languages
      'lang_tr': 'Türkisch',
      'lang_en': 'Englisch',
      'lang_es': 'Spanisch',
      'lang_fr': 'Französisch',
      'lang_de': 'Deutsch',
      'lang_it': 'Italienisch',
      'settings': 'Einstellungen',
      'font_size': 'Schriftgröße',
      'go_to_last_saved_page': 'Zur zuletzt gespeicherten Seite gehen',
      'no_books_opened': 'Noch keine Bücher geöffnet',
      'no_name': 'Kein Name',

      // Reader
      'translate': 'Übersetzen',
      'translation': 'Übersetzung',
      'translation_not_found': 'Übersetzung nicht gefunden',
      'exit': 'Beenden',
      'save_reading_position_message':
          'Möchten Sie Ihre Leseposition speichern?',
      'save_book': 'Buch Speichern',
      'save_book_message':
          'Dieses Buch ist nicht in Ihrer Bibliothek. Möchten Sie es hinzufügen?',

      // About
      'polread_desc':
          'PolyRead ist eine moderne E-Book-Lese- und digitale Bibliotheks-App, die das Lesen organisierter, angenehmer und produktiver gestaltet.',
      'app_view_description':
          'PolyRead hilft dir, regelmäßig, angenehmer und produktiver zu lesen, mit einer modernen E-Book-Lese- und digitalen Bibliotheks-App. Halte alle deine Bücher an einem Ort, lese bequem, verfolge deinen Fortschritt und baue eine tägliche Lesepraxis auf. 📚 Erweiterte Leseerfahrung Betrachte EPUBs und digitale Bücher bequem mit einer fließenden, modernen Leseoberfläche ohne Ablenkung. Setze dort fort, wo du aufgehört hast. Automatische Lesefortschrittsverfolgung. 📖 Baue deine digitale Bibliothek Organisiere alle deine Bücher an einem Ort. Erstelle dein persönliches Bücherarchiv. Kategorisiere und verwalte deine Bücher einfach. 📈 Leseverfolgung und Motivation Verfolge deinen Lesefortschritt. Baue eine tägliche Lesepraxis auf. Erreiche deine Ziele mit mehr Disziplin.',
    },
    'it': {
      'app_view_description':
          'PolyRead ti aiuta a leggere in modo più regolare, piacevole e produttivo con un moderno lettore di ebook e una libreria digitale. Tieni tutti i tuoi libri in un unico posto, leggi facilmente, traccia i tuoi progressi e costruisci una routine giornaliera di lettura. 📚 Esperienza di lettura avanzata Visualizza EPUB e libri digitali con comfort grazie a un\'interfaccia moderna e fluida, senza distrazioni. Riprendi da dove hai interrotto. Tracciamento automatico del progresso di lettura. 📖 Crea la tua libreria digitale Organizza tutti i tuoi libri in un unico posto. Crea il tuo archivio personale. Categoria e gestisci facilmente i tuoi libri. 📈 Monitoraggio e motivazione della lettura Tieni traccia del tuo progresso di lettura. Costruisci una routine giornaliera di lettura. Raggi i tuoi obiettivi con più disciplina.',
    },
  };
}
