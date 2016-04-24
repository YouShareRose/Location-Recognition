/*
 * MATLAB Compiler: 6.1 (R2015b)
 * Date: Sun Apr 10 21:12:19 2016
 * Arguments: "-B" "macro_default" "-W" "java:plotdemo,plotter" "-T" "link:lib" "-d" 
 * "F:\\DesignLife\\GradPrj\\code\\Location-Recognition\\matlab\\plotdemo\\for_testing" 
 * "class{plotter:F:\\DesignLife\\GradPrj\\code\\Location-Recognition\\matlab\\PlotExample\\PlotDemoComp\\drawplot.m}" 
 */

package plotdemo;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class PlotdemoMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "plotdemo_59A3B667F724892BE3A43005E273EE2E";
    
    /** Component name */
    private static final String sComponentName = "plotdemo";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(PlotdemoMCRFactory.class)
        );
    
    
    private PlotdemoMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            PlotdemoMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{9,0,0}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}
