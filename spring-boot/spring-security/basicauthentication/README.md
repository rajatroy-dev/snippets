# BASIC AUTHENTICATION USING SPRING SECURITY
   
*Basic authentication is a simple authentication scheme built into the HTTP protocol. The client sends HTTP requests with the Authorization header that contains the word Basic word followed by a space and a base64-encoded string username:password.*

1. Go to [spring initializr](https://start.spring.io/).
2. Select **Project** (Here we will choose `Maven`).
3. Select **Language** (Here we will choose `Java`).
4. Select **Spring Boot** version (Here we will choose `2.5.6`).
5. Provide **Project Metadata** details:
   1. **Group** (Here we will enter `in.rajatroy`).
   2. **Artifact** (Here we will enter `basicauthentication`).
   3. **Name** (auto-filled).
   4. **Description** (Here we will enter `Basic authentication using Spring Security`).
   5. **Package name** (auto-filled).
   6. **Packaging** (Here we choose `Jar`).
   7. **Java** (Here we choose `11`).
6. **Dependencies** (Here we add the following):
   1. **Spring Security**
   2. **Spring Web**
7. Click on **Generate**.
8.  Extract the downloaded zip.
9.  Open up the extracted folder in your IDE.
10. Create `model` package inside `src/main/java/in.rajatroy/basicauthentication` package.
11. Inside `model` package, create `Student` class.
12. Add two properties, **id** and **name** to `Student` class and add their corresponding **getters**, **setters** and **contructor**.
13. Inside `src/main/java/in.rajatroy/basicauthentication` package create `controller` package.
14. Inside, `controller` package, create `StudentController.java` file.
15. Annotate `StudentController` with `@RestController` and `@RequestMapping("api/v1/students")`.
16. Create a constant list of students as a temporary database inside `StudentController`.
17. Create method for `GET` student.
18. Annotate `GET` method with `@GetMapping(/{id})`.
19. Create a `security` package under `src/main/java/in.rajatroy/basicauthentication`.
20. Inside `security` package, create `ApplicationSecurityConfig.java` file.
21. Annotate `ApplicationSecurityConfig` class with `@Configuration` and `@EnableWebSecurity`.
22. `ApplicationSecurityConfig` class needs to extend `WebSecurityConfigurerAdapter`.
23. In `ApplicationSecurityConfig` class, override `configure(HttpSecurity http)` method.
24. Inside `configure(HttpSecurity http)`, remove existing statements and add the following:

         http
            .authorizeRequests()
            .anyRequests()
            .authenticated()
            .and()
            .httpBasic();

25. Run the project.
26. Username is **"user"**.
27. Use password from console.
28. There is no requirement to logout as every request needs username and password to be authenticated.