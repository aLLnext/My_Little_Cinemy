package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Book;
import org.springframework.data.repository.CrudRepository;

public interface BookRepo extends CrudRepository<Book, Long> {
}
