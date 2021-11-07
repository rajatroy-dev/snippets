package in.rajatroy.formbasedauthentication.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.rajatroy.formbasedauthentication.model.Student;

@RestController
@RequestMapping("api/v1/students")
public class StudentController {

	private static final List<Student> students = Arrays.asList(
				new Student("1", "Carl M. Knapp"),
				new Student("2", "Gilbert B. Tickle"),
				new Student("3", "Terrence A. Nelson")
			);

	@GetMapping("/{id}")
	public Student getStudent(@PathVariable String id) {
		return students.stream()
				.filter(student -> student.getId().equals(id))
				.findFirst()
				.orElseThrow(() -> new IllegalStateException("Student with id: " + id + " doesn't exist!"));
	}
}
