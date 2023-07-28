package resources;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/resources/*"})
public class ResourceServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = request.getPathInfo();
    if (path == null || path.equals("/")) {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
      return;
    }

    String contentType = null;
    if (path.endsWith(".css")) {
      contentType = "text/css";
    } else if (path.endsWith(".js")) {
      contentType = "application/javascript";
    } else if (path.endsWith(".png")|| path.endsWith(".jpg")) {
      contentType = "image/png";
    } else {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
      return;
    }

    response.setContentType(contentType);
    response.setCharacterEncoding("UTF-8");

    String resourcePath = "/WEB-INF/resources" + path;
    getServletContext().getRequestDispatcher(resourcePath).forward(request, response);
  }
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
  }
}