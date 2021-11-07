# FORM-BASED AUTHENTICATION USING SPRING SECURITY
   
1. Go to [spring initializr](https://start.spring.io/).
2. Select **Project** (Here we will choose `Maven`).
3. Select **Language** (Here we will choose `Java`).
4. Select **Spring Boot** version (Here we will choose `2.5.6`).
5. Provide **Project Metadata** details:
   1. **Group** (Here we will enter `in.rajatroy`).
   2. **Artifact** (Here we will enter `formbasedauthentication`).
   3. **Name** (auto-filled).
   4. **Description** (Here we will enter `Form-based authentication using Spring Security`).
   5. **Package name** (auto-filled).
   6. **Packaging** (Here we choose `Jar`).
   7. **Java** (Here we choose `11`).
6. **Dependencies** (Here we add the following):
   1. **Spring Security**
   2. **Spring Web**
7. Click on **Generate**.
8.  Extract the downloaded zip.
9.  Open up the extracted folder in your IDE.
10. Create `model` package inside `src/main/java/in.rajatroy/formbasedauthentication` package.
11. Inside `model` package, create `Student` class.
12. Add two properties, **id** and **name** to `Student` class and add their corresponding **getters**, **setters** and **contructor**.
13. Inside `src/main/java/in.rajatroy/formbasedauthentication` package create `controller` package.
14. Inside, `controller` package, create `StudentController.java` file.
15. Annotate `StudentController` with `@RestController` and `@RequestMapping("api/v1/students")`.
16. Create a constant list of students as a temporary database inside `StudentController`.
17. Create method for `GET` student.
18. Annotate `GET` method with `@GetMapping(/{id})`.
19. Run the project.
20. Username is **"user"**.
21. Use password from console.
22. Logout URL is `http://<your-url>/logout`.