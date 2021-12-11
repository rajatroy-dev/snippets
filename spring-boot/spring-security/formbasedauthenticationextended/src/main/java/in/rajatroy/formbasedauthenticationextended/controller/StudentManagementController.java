package in.rajatroy.formbasedauthenticationextended.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.rajatroy.formbasedauthenticationextended.model.Student;

@RestController
@RequestMapping("management/api/v1/student")
public class StudentManagementController {

	private static final List<Student> students = Arrays.asList(
			new Student("1", "Carl M. Knapp"),
			new Student("2", "Gilbert B. Tickle"),
			new Student("3", "Terrence A. Nelson")
		);
	
	@GetMapping("{id}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ADMINTRAINEE')")
	public Student getStudentById(@PathVariable String id) {
		return students.stream()
				.filter(student -> student.getId().equals(id))
				.findFirst()
				.orElseThrow(() -> new IllegalStateException("Student with id: " + id + " doesn't exist!"));
	}
	
	@GetMapping("")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ADMINTRAINEE')")
	public List<Student> getAllStudents() {
		return students;
	}
	
	@PostMapping("")
	@PreAuthorize("hasAuthority('student:write')")
	public Student createStudent(@RequestBody Student student) {
		return student;
	}
	
	@DeleteMapping("{id}")
	@PreAuthorize("hasAuthority('student:write')")
	public String deleteStudent(@PathVariable String id) {
		return String.format("Student with id: %s deleted.", id);
	}
	
	@PutMapping("")
	@PreAuthorize("hasAuthority('student:write')")
	public Student updateStudent(@RequestBody Student student) {
		return student;
	}
}
