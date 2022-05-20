package exception;
/**
 * @ClassName: FindProductByIdException
 * @Description: TODO
 * @author: Guohao
 * @Version: 1.0
 **/

public class FindProductByIdException extends Exception {

    private static final long serialVersionUID = 1L;

    public FindProductByIdException() {
        super();
    }

    public FindProductByIdException(String message, Throwable cause) {
        super(message, cause);
    }

    public FindProductByIdException(String message) {
        super(message);
    }

    public FindProductByIdException(Throwable cause) {
        super(cause);
    }

}
