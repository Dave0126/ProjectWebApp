package exception;
/**
 * @ClassName: RegisterException
 * @Description: TODO
 * @author: Guohao
 * @Version: 1.0
 **/
//注册用户
public class RegisterException extends Exception {

    private static final long serialVersionUID = 1L;

    public RegisterException() {
        super();
        // TODO Auto-generated constructor stub
    }

    public RegisterException(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

    public RegisterException(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }

    public RegisterException(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }

}
