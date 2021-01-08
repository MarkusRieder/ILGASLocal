/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.listener;

import com.codahale.metrics.MetricRegistry;

/**
 *
 * @author Markus Rieder
 */
public final class MetricRegistrySingleton {

    public static final MetricRegistry metrics = new MetricRegistry();
}
