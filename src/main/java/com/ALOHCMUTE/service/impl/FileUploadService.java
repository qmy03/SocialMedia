package com.ALOHCMUTE.service.impl;

import java.nio.file.Path;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	public String saveFile(MultipartFile file, String uploadDirectory) {
        try {
            // Generate a unique filename for the uploaded picture
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String uniqueFileName = System.currentTimeMillis() + "_" + Math.random() + fileExtension;

            // Construct the full file path using Paths.get
            Path filePath = Paths.get(uploadDirectory, uniqueFileName);

            // Save the file to the specified directory
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // Return the unique filename to be stored in the database
            return uniqueFileName;
        } catch (Exception e) {
            // Handle the exception, e.g., log it or throw a custom exception
            e.printStackTrace();
            return null;
        }
    }
}
