package ie.irishliterature.shiro.jdbcRealm;

import org.apache.shiro.cache.ehcache.EhCacheManager;

/**
 *
 * @author Markus Rieder
 */
public class ILGASShiroCacheManager extends EhCacheManager {

//    https://www.ehcache.org/documentation/2.8/code-samples.html
    
    public ILGASShiroCacheManager() {
        setCacheManager( net.sf.ehcache.CacheManager.create() );
        String[] cacheNames = net.sf.ehcache.CacheManager.getInstance().getCacheNames();
        System.out.println( "cacheNames " );
        System.out.println( cacheNames );
    }
}
