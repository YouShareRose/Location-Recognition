/*
 * MATLAB Compiler: 6.1 (R2015b)
 * Date: Sun Apr 10 20:43:37 2016
 * Arguments: "-B" "macro_default" "-W" "java:drawplot,Class1" "-T" "link:lib" "-d" 
 * "F:\\DesignLife\\GradPrj\\code\\Location-Recognition\\matlab\\drawplot\\for_testing" 
 * "class{Class1:F:\\DesignLife\\GradPrj\\code\\Location-Recognition\\matlab\\PlotExample\\PlotDemoComp\\drawplot.m}" 
 */

package drawplot;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class DrawplotMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "drawplot_45CDAEDD9F7CE8470920E546D5A2262C";
    
    /** Component name */
    private static final String sComponentName = "drawplot";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(DrawplotMCRFactory.class)
        );
    
    
    private DrawplotMCRFactory()
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
            DrawplotMCRFactory.class, 
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
