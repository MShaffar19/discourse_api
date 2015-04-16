module DiscourseApi
  module API
    module Backups
      def backups
        response = get("/admin/backups.json")
        response.body
      end

      def create_backup
        post("/admin/backups", with_uploads: true)
      end

      def restore_backup(file_name)
        post("/admin/backups/#{file_name}/restore")
      end

      def download_backup(file_name)
        response = get("/admin/backups/#{file_name}")
        # write file
        File.open('examples/backup.tar.gz', 'wb') { |fp| fp.write(response.body) }
      end
    end
  end
end
