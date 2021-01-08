package ie.irishliterature.dao;

import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;

/**
 *
 * @author Markus Rieder
 */
/**
 * <pre>
 * Mainly defines the operation of saving session, updating, deleting, reading, and getting all collections in the cache.
 * </pre>
 * <small> 2018/12/24 | eriz</small>
 */
public class ShiroSessionDAO  extends EnterpriseCacheSessionDAO {

    private String activeSessionsCacheName;

    public ShiroSessionDAO(String activeSessionsCacheName) {
        this.activeSessionsCacheName = activeSessionsCacheName;
    }

    @Override
    public String getActiveSessionsCacheName() {
        return this.activeSessionsCacheName;
    }
}
