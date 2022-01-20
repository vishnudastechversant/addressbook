component persistent="true"  entityname="states" table="tbl_states" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="name" column="name" ormtype="string";
    property name="countryId" fkcolumn="country_id" fieldtype="many-to-one" cfc="countries";
}