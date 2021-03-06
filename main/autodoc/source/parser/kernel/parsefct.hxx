/**************************************************************
 * 
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 * 
 *************************************************************/



#ifndef ADC_PARSER_PARSEFCT_HXX
#define ADC_PARSER_PARSEFCT_HXX


#include <autodoc/parsing.hxx>


/** Interface for parsing code of a programming language and
    delivering the information into an Autodoc Repository.
**/
class ParseToolsFactory : public autodoc::ParseToolsFactory_Ifc
{
  public:
                        ParseToolsFactory();
	virtual				~ParseToolsFactory();

    virtual DYN autodoc::CodeParser_Ifc *
                        Create_Parser_Cplusplus() const;
    virtual DYN autodoc::DocumentationParser_Ifc *
                        Create_DocuParser_AutodocStyle() const;
    virtual DYN autodoc::FileCollector_Ifc *
                        Create_FileCollector(
                            uintt               i_nEstimatedNrOfFiles ) const;
  private:
    static DYN ParseToolsFactory *
                        dpTheInstance_;

    friend class autodoc::ParseToolsFactory_Ifc;
};


#endif

