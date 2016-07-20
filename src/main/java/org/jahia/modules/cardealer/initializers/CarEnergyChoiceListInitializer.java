package org.jahia.modules.cardealer.initializers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.jcr.PropertyType;

import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;

/**
 * Choice list initializer to show available energies for a car.
 * 
 * @author Michael de Checchi
 */
public class CarEnergyChoiceListInitializer implements ModuleChoiceListInitializer {

	// Diesel energy.
	private static String DIESEL = "diesel";

	// Unleaded energy.
	private static String UNLEADED = "unleaded";

	// Gas energy.
	private static String GAS = "gas";

	// Electric energy.
	private static String ELECTRIC = "electric";
	
	// Items to show
	private List<ChoiceListValue> items;

	// Key of this initializer
	private String key;

	/**
	 * {@inheritDoc}
	 */
	@Override
	public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param,
			List<ChoiceListValue> values, Locale locale, Map<String, Object> context) {
		items = new ArrayList<ChoiceListValue>(4);
		items.add(new ChoiceListValue(DIESEL, null, new ValueImpl(DIESEL, PropertyType.STRING, false)));
		items.add(new ChoiceListValue(UNLEADED, null, new ValueImpl(UNLEADED, PropertyType.STRING, false)));
		items.add(new ChoiceListValue(GAS, null, new ValueImpl(GAS, PropertyType.STRING, false)));
		items.add(new ChoiceListValue(ELECTRIC, null, new ValueImpl(ELECTRIC, PropertyType.STRING, false)));
		Collections.sort(items);
		return items;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void setKey(String key) {
		this.key = key;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public String getKey() {
		return this.key;
	}

}
