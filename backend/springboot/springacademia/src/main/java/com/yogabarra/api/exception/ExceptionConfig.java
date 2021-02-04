package com.yogabarra.api.exception;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ExceptionConfig {
  @ExceptionHandler({
          EmptyResultDataAccessException.class // Internal server error
  })
  public ResponseEntity errorNotFound(Exception ex){
    return ResponseEntity.notFound().build();
  }

  @ExceptionHandler({
          IllegalArgumentException.class
  })
  public ResponseEntity errorBadRequest(Exception ex){
    return ResponseEntity.badRequest().build();
  }
}
