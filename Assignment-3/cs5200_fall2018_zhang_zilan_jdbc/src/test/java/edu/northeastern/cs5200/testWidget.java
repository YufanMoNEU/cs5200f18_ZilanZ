package edu.northeastern.cs5200;

import edu.northeastern.cs5200.daos.PageDao;
import edu.northeastern.cs5200.daos.WidgetDao;
import edu.northeastern.cs5200.models.Page;
import edu.northeastern.cs5200.models.Widget;
import org.junit.Test;

import java.util.Collection;

public class testWidget extends JdbcAssignmentApplicationTests {

    WidgetDao dao = WidgetDao.getInstance();

    @Test
    public void testCreateWidgetForPage() {
        Widget widget1 = new Widget(345, "head345", 0, 0, null, null, "Hi", 1);
        Widget widget2 = new Widget(456, "intro456", 0, 0, null, null, "<h1>Hi</h1>", 2);
        Widget widget3 = new Widget(567, "image345", 50, 100, null, null, null, 3);
        dao.createWidgetForPage(345, widget1);
        dao.createWidgetForPage(345, widget2);
        dao.createWidgetForPage(345, widget3);
    }

    @Test
    public void testFindAllWidget() {
        Collection<Widget> widgets = dao.findAllWidgets();
    }

    @Test
    public void testFindWidgetById() {
        Widget widget = dao.findWidgetById(345);
    }

    @Test
    public void testFindWidgetsForPage() {
        Collection<Widget> widgets = dao.findWidgetsForPage(345);
    }

    @Test
    public void testUpdateWidget() {
        Widget widget = new Widget(345, "head345-change", 100, 50, null, null, "Hi!!!", 1);
        PageDao pageDao = PageDao.getInstance();
        Page page = pageDao.findPageById(345);
        widget.setPage(page);
        int result = dao.updateWidget(345, widget);
    }

    @Test
    public void testDeleteWidget() {
        int result = dao.deleteWidget(345);
    }
}
