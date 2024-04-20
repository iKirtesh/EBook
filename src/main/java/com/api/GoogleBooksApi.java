package com.api;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.books.v1.Books;
import com.google.api.services.books.v1.model.Volumes;

import java.io.IOException;
import java.security.GeneralSecurityException;


public class GoogleBooksApi {

    private static final String API_KEY = "AIzaSyBCc2192XdeUbdDnsgGZCyrDtZSVcDq3vI";
    private static final String APPLICATION_NAME = "Google Books";

    public static Volumes searchBooks(String query) throws IOException, GeneralSecurityException {
        try {
            NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
            JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();

            Books books = new Books.Builder(httpTransport, jsonFactory, null)
                    .setApplicationName(APPLICATION_NAME)
                    .build();

            Books.Volumes.List list = books.volumes().list(query);
            list.setKey(API_KEY);

            return list.execute();
        } catch (IOException | GeneralSecurityException e) {
            e.printStackTrace();
            throw e; // rethrow the exception to propagate it to the calling code
        }
    }
}


